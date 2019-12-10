using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Sinco.Infra.Implementation
{
    public class GenericRepository<TEntity> where TEntity : class
    {
        private readonly SincoABREntities _context;
        private readonly DbSet<TEntity> _dbSet;

        public GenericRepository(SincoABREntities context)
        {
            _context = context;
            _dbSet = context.Set<TEntity>();
        }

        public void Create(TEntity entity)
        {
            _dbSet.Add(entity);
        }

        public TEntity CreateReturn(TEntity entity)
        {
            return _dbSet.Add(entity);
        }

        public void CreateRange(IEnumerable<TEntity> entities)
        {
            foreach (var entity in entities) Create(entity);
        }

        public IQueryable<TEntity> GetAll()
        {
            return _dbSet;
        }

        public async Task<TEntity> FindAsync(params object[] keyValues)
        {
            return await _dbSet.FindAsync(keyValues);
        }

        public TEntity FindById(int id)
        {
            return _dbSet.Find(id);
        }

        public virtual IQueryable<TEntity> SelectQuery(string query, params object[] parameters)
        {
            return _dbSet.SqlQuery(query, parameters).AsQueryable();
        }

        public IQueryable<TEntity> Filter(Expression<Func<TEntity, bool>> expression)
        {
            return _dbSet.Where(expression);
        }

        public void Update(TEntity entity)
        {
            _context.Set<TEntity>().AddOrUpdate(entity);
        }

        public void Delete(TEntity entity)
        {
            if (_context.Entry(entity).State == EntityState.Detached) _dbSet.Attach(entity);
            _dbSet.Remove(entity);
        }

        public async Task Delete(params object[] id)
        {
            var entity = await FindAsync(id);
            if (entity != null) Delete(entity);
        }

        public List<TEntity> SqlQuery<TEntity>(string sql, params object[] parameters)
        {
            try
            {
                return _context.Database.SqlQuery<TEntity>(sql, parameters).ToList();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;
        }

        public TEntity Find(Expression<Func<TEntity, bool>> filter = null, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderby = null, string includeProperties = "")
        {
            try
            {
                IQueryable<TEntity> query = _dbSet;
                if (filter != null)
                {
                    query = query.Where(filter);
                }
                foreach (var includeProperty in includeProperties.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
                {
                    query = query.Include(includeProperty);
                }

                if (orderby != null)
                {
                    query = orderby(query);
                }

                return query?.FirstOrDefault();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return null;
        }

        public void Dispose()
        {
            _context?.Dispose();
        }
    }
}